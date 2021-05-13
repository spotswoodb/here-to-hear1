module EventsHelper
    def event_count(venue)
        Venue.find_by_id(venue.id).events.count
    end
end
