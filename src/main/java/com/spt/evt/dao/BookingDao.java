package com.spt.evt.dao;

import java.util.List;

import com.spt.evt.dto.SearchCriteria;
import com.spt.evt.entity.Booking;
import com.spt.evt.entity.Hotel;

/**
 * A Dao interface for retrieving hotels and bookings from a backing repository. Also supports the ability to cancel
 * a booking.
 */
public interface BookingDao {

    /**
     * Find bookings made by the given user
     * @param username the user's name
     * @return their bookings
     */
    public List<Booking> findBookings(String username);

    /**
     * Find hotels available for booking by some criteria.
     * @param criteria the search criteria
     * @return a list of hotels meeting the criteria
     */
    public List<Hotel> findHotels(SearchCriteria criteria);

    /**
     * Find hotels by their identifier.
     * @param id the hotel id
     * @return the hotel
     */
    public Hotel findHotelById(Long id);

	/**
	 * Updates the hotel
	 */
	public void updateHotel(Hotel hotel);

}

