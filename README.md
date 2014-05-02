ISO8601 date/time library
=========================

ISO8601 is a standard for the string representation of dates, times and durations, and includes a timezone concept as well as partial dates and times.

This library provides a way of converting between strings, ISO8601_XXX instances and instances of the Eiffel 'time' library, i.e. DATE, TIME, etc. The reason to use the ISO8601 representation is to a) provide parsing from String form, and b) to give access to the parts of dates, times and durations. If arithmetic operations are needed, convert first to the Eiffel DATE, TIME etc types.

The most typicla mode of use is as below:

    class MY_CLASS
    inherit
        ISO8601_ROUTINES
    
    feature -- Conversion
    
        some_routine (a_str: STRING)
        	local
        		iso_date: ISO8601_DATE
        		eif_date: DATE
        		str_date: STRING
        		day_in_year: INTEGER
        	do
        		...
        		
        		-- String => ISO8601 object
        		iso_date := iso8601_string_to_date (a_str)
        		
        		-- get parts
        		day_in_year := iso_date.day
        		month_in_year := iso_date.month
        		
        		-- convert to DATE
        		eif_date := iso_date.to_date
        		
        		-- do some arithmetic
        		eif_date.day_add (5)
        		
        		-- convert back, using 'convert' routines
        		iso_date := eif_date
        		str_date := iso_date.as_string
        		
         		...
         	end
        end
    end

The class ISO8601_ROUTINES provides various routines:

    class interface
    	ISO8601_ROUTINES

    create 
    	default_create

    feature -- Conversion

    	date_time_to_iso8601_string (a_dt: DATE_TIME): STRING_8
    			-- make into string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
    		ensure
    			result_valid: valid_iso8601_date_time (Result)

    	date_to_iso8601_string (a_date: DATE): STRING_8
    			-- make into string of ISO8601 format "YYYY-MM-DD"
    		ensure
    			result_valid: valid_iso8601_date (Result)

    	duration_to_iso8601_string (a_dur: DATE_TIME_DURATION): STRING_8
    			-- make into string using ISO8601 format "PNNDTNNhNNmNNs"
    		ensure
    			result_valid: valid_iso8601_duration (Result)

    	iso8601_string_to_comparable_duration (str: STRING_8): DATE_TIME_DURATION
    			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
    		require
    			str_valid: valid_iso8601_duration (str)

    	iso8601_string_to_date (str: STRING_8): DATE
    			-- make from string using ISO8601 format "YYYY-MM-DD"
    		require
    			str_valid: valid_iso8601_date (str)

    	iso8601_string_to_date_time (str: STRING_8): DATE_TIME
    			-- make from string using ISO8601 format "YYYY-MM-DDThh:mm:ss[.ssss]"
    		require
    			str_valid: valid_iso8601_date_time (str)

    	iso8601_string_to_duration (str: STRING_8): DATE_TIME_DURATION
    			-- make from string using ISO8601 format "PNNDTNNhNNmNNs"
    		require
    			str_valid: valid_iso8601_duration (str)

    	iso8601_string_to_time (str: STRING_8): TIME
    			-- make from string using ISO8601 format "Thh:mm:ss[.ssss]"
    		require
    			str_valid: valid_iso8601_time (str)

    	time_to_iso8601_string (a_time: TIME): STRING_8
    			-- make into string using ISO8601 format "Thh:mm:ss[.ssss]"
    		ensure
    			result_valid: valid_iso8601_time (Result)
    	
    feature -- Definitions

    	Date_separator: CHARACTER_8 = '-'

    	Decimal_separator: CHARACTER_8 = '.'

    	Duration_leader: CHARACTER_8 = 'P'

    	Iso8601_decimal_separator: CHARACTER_8 = ','

    	Iso_class_name_leader: STRING_8 = "ISO8601_"

    	Time_leader: CHARACTER_8 = 'T'

    	Time_separator: CHARACTER_8 = ':'

    	Time_zone_gmt: CHARACTER_8 = 'Z'
    	
    feature -- Validity

    	valid_day (y, m, d: INTEGER_32): BOOLEAN
    			-- True if d >= 1 and d <= days_in_month(m, y)

    	valid_fractional_second (fs: REAL_64): BOOLEAN
    			-- True if fs >= 0.0 and fs < 1.0

    	valid_hour (h, m, s: INTEGER_32): BOOLEAN
    			-- True if (h >= 0 and h < Hours_in_day) or (h = Hours_in_day and m = 0 and s = 0)

    	valid_iso8601_date (str: STRING_8): BOOLEAN
    			-- True if string in one of the forms
    			--	YYYY
    			--	YYYYMM
    			--	YYYY-MM
    			--	YYYYMMDD
    			--	YYYY-MM-DD

    	valid_iso8601_date_time (str: STRING_8): BOOLEAN
    			-- True if string in form "YYYY-MM-DDThh:mm:ss[,sss]"

    	valid_iso8601_duration (str: STRING_8): BOOLEAN
    			-- True if string in form "PnDTnHnMnS"

    	valid_iso8601_time (str: STRING_8): BOOLEAN
    			-- True if string in one of the forms:
    			--	hh
    			--	hhmm
    			--	hh:mm
    			--  hhmmss
    			--  hhmmss,sss
    			-- 	hh:mm:ss
    			-- 	hh:mm:ss,sss
    			-- with optional timezone in form:
    			--	Z
    			--	+hhmm
    			--	-hhmm

    	valid_minute (m: INTEGER_32): BOOLEAN
    			-- True if m >= 0 and m < Minutes_in_hour

    	valid_month (m: INTEGER_32): BOOLEAN
    			-- True if m >= 1 and m <= Months_in_year

    	valid_second (s: INTEGER_32): BOOLEAN
    			-- True if s >= 0 and s < Seconds_in_minute

    	valid_year (y: INTEGER_32): BOOLEAN
    			-- True if year >= 0
    	
    end -- class ISO8601_ROUTINES


This class also contains a once instance of the class ISO8601_PARSER. This is a handbuilt parser that does all the conversion from String form. Since parsing for a routine like valid_iso8601_date is the same work as actually converting from a String to an ISO8601_DATE, the parser maintains a cached copy of any successfully parsed String in its ISO8601_XX form, in order for a subsequent call, of the form:

    a_str := "2002-04-23T09:25:00"
    if valid_iso8601_date_time (a_str) then
    	an_iso8601_date_time := iso8601_string_to_date_time (a_str)
    end
        		
Otherwise, every class ISO8601_DATE, ISO8601_TIME, ISO8601_DATE_TIME and ISO8601_DURATION provides an accessor interface that exposes the numerical parts of the date, time, date/time or duration.
