namespace :fahrsammlung do
  desc 'sends out notifications for newly invisible items and deletes items too old'
  task handle_obsolete: :environment do
    Offer.outdated.find_each do |offer|
      handle_obsolete offer
    end
    Request.outdated.find_each do |request|
      handle_obsolete request
    end
  end

  desc 'creates new history item'
  task create_history_item: :environment do
    offers_count = Offer.visible_for(nil, Offer).count
    requests_count = Request.visible_for(nil, Request).count
    HistoryItem.create({offers_count: offers_count, requests_count: requests_count})
  end

  desc 'unlock all locked users who have offers or requests'
  task unlock_locked_users: :environment do
    User.locked.each do |user|
      if user.offers.count > 0 || user.requests.count > 0
        user.unlock!
        if user.confirmed?
          Subscription.offers.confirmed.each do |subscriber|
            user.offers.each do |offer|
              SubscriptionMailer.new_item_notification(offer, subscriber).deliver_now
            end
          end
          Subscription.requests.confirmed.each do |subscriber|
            user.requests.each do |request|
              SubscriptionMailer.new_item_notification(request, subscriber).deliver_now
            end
          end
        end
      end
    end
  end

  def handle_obsolete item
    reactivator = ItemReactivator.find_by item: item
    if reactivator.nil?
      reactivator = ItemReactivator.create! item: item
      UserMailer.reactivate_item_mail(item, reactivator.token).deliver_now
    elsif reactivator && reactivator.created_at < 100.days.ago
      reactivator.destroy
      item.destroy
    end
  end
end

