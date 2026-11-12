DROP VIEW IF EXISTS churn_desp;
-------------------------------------------------------
CREATE TABLE churn(
	ID_customer SERIAL PRIMARY KEY,
	State CHAR(2) NOT NULL,
	Account_length INTEGER NOT NULL,
	Area_code INTEGER NOT NULL,
	International_plan BOOLEAN NOT NULL,
	Voice_mail_plan	BOOLEAN NOT NULL,
	Number_vmail_messages INTEGER NOT NULL,
	Total_day_minutes FLOAT NOT NULL,
	Total_day_calls INTEGER NOT NULL,
	Total_day_charge FLOAT NOT NULL,
	Total_eve_minutes FLOAT NOT NULL,
	Total_eve_calls	INTEGER NOT NULL,
	Total_eve_charge FLOAT NOT NULL,
	Total_night_minutes FLOAT NOT NULL,
	Total_night_calls INTEGER NOT NULL,
	Total_night_charge FLOAT NOT NULL,
	Total_intl_minutes FLOAT NOT NULL,
	Total_intl_calls INTEGER NOT NULL,
	Total_intl_charge FLOAT NOT NULL,
	Customer_service_calls INTEGER NOT NULL,
	Churn BOOLEAN NOT NULL
);
----------------------------------------------
CREATE TABLE churn_desp AS SELECT id_customer, account_length, 
									state, area_code, 
									international_plan, voice_mail_plan,
									number_vmail_messages, customer_service_calls,
									churn,
									hours, calls, charge, minutes
		FROM churn
		CROSS JOIN LATERAL(
			VALUES
				('Day', total_day_calls, total_day_charge, total_day_minutes),
				('Eve', total_day_calls, total_day_charge, total_day_minutes),
				('Night', total_day_calls, total_day_charge, total_day_minutes),
				('Intl', total_day_calls, total_day_charge, total_day_minutes)
		) AS t(hours, calls, charge, minutes);
--------------------------------------------------------