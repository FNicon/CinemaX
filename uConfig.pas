unit uConfig;

interface
     const
          ARRAY_LIMIT = 100;
          DATABASE_FILM_FILENAME = 'database_film.txt';
          DATABASE_DATE_FILENAME = 'database_date.txt';
          DATABASE_SCHEDULE_FILENAME = 'database_schedule.txt';
          DATABASE_CAPACITY_FILENAME = 'database_capacity.txt';
          DATABASE_TRANSACTION_FILENAME = 'database_transaction.txt';
          DATABASE_SNACK_FILENAME = 'database_snack.txt';
          DATABASE_MEMBER_FILENAME = 'database_member.txt';
          COMMAND_NUMBER = 15;
          COMMAND_LIST : array[1..COMMAND_NUMBER] of string = (
                                                            'help', 
                                                            'nowPlaying', 
                                                            'showUpcoming', 
                                                            'showSchedule', 
                                                            'genreFilter',
                                                            'ratingFilter',
                                                            'search',
                                                            'showMovie',
                                                            'showNextDay',
                                                            'selectMovie',
                                                            'payCreditCard',
                                                            'payMember',
                                                            'login',
                                                            'register',
                                                            'exit'
                                                            );
implementation

end.
