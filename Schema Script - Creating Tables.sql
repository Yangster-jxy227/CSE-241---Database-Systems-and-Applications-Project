CREATE table customer(
    ID          char(4),
    password    varchar(25),
    email       varchar(25),
    address     varchar(75),
    phone_num   char(10),
    primary key (ID));
    
CREATE table goods(
    product_ID  char(8),
    price       decimal(10, 2),
    name        varchar(25),
    vendor      varchar(50),
    primary key (product_ID));
    
CREATE table Purchase(
    transaction_ID  char(4),
    amount          varchar(25),
    purchase_date   varchar(25),
    customer_ID     char(4),
    product_ID      char(8),
    primary key (transaction_ID),
    foreign key (customer_ID) references customer,
    foreign key (product_ID) references Goods
    );
    
CREATE table individual(
    ID          char(4),
    first_name  varchar(15),
    last_name   varchar(15),
    Role        varchar(8),
    primary key (ID),
    foreign key(ID) references customer
    );
    
CREATE table business(
    ID          char(4),
    company_name varchar(30),
    primary key (ID),
    foreign key(ID) references customer
    );
    
CREATE table item(
    product_ID  char(8),
    stock       varchar(4),
    primary key (product_ID),
    foreign key (product_ID) references goods
    );
    
CREATE table service(
    product_ID      char(8),
    duration_days   varchar(3),
    primary key (product_ID),
    foreign key (product_ID) references goods
    );

CREATE table bank_account(
    account_ID  char(8),
    route_ID    char(4),
    balance     decimal(12, 2),
    price       decimal(10, 2),
    primary key (account_ID)
    );
    
CREATE table credit_card(
    card_num        char(16),
    security_code   char(3),
    network         varchar(15),
    interest        varchar(5),
    balance         decimal(12, 2),
    price           decimal(10, 2),
    credit_score    char(3),
    primary key (card_num)
    );
    
CREATE table installment(
    plan            varchar(15),    
    interest        varchar(5),
    duration_days   varchar(3),    
    price           decimal(10, 2),
    primary key (plan)
    );
    
CREATE table bank_purchase(
    account_ID          char(8),
    confirmation_code   char(6),
    transaction_ID      char(4),
    primary key (transaction_ID),
    foreign key (account_ID) references bank_account,
    foreign key (transaction_ID) references purchase
);

CREATE table credit_card_purchase(
    transaction_ID      char(4),
    fee_amount          decimal(5, 2),
    card_num            char(16),
    primary key (transaction_ID),
    foreign key (transaction_ID) references purchase,
    foreign key (card_num) references credit_card
);

CREATE table installment_purchase(
    plan                varchar(15),
    monthly_payment     decimal(7, 2),
    duration_days       varchar(3),
    transaction_ID      char(4),
    primary key (transaction_ID),
    foreign key (plan) references installment,
    foreign key (transaction_ID) references purchase
);

