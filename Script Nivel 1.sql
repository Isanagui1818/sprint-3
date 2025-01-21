/*- Exercici 1 La teva tasca és dissenyar i crear una taula anomenada "credit_card" que emmagatzemi detalls crucials sobre les targetes de crèdit. 
La nova taula ha de ser capaç d'identificar de manera única cada targeta i establir una relació adequada amb les altres dues taules ("transaction" i "company"). 
Després de crear la taula serà necessari que ingressis la informació del document denominat "dades_introduir_credit". Recorda mostrar el diagrama i realitzar una 
breu descripció d'aquest.*/

create table transactions.credit_card(
	id varchar(255) primary key,
    iban varchar(255) null,
    pan varchar(255) null,
    pin smallint  null,
    cvv smallint  null,
    expiring_date varchar(255) null); #tenia problemas usando el formato date 

show columns from transactions.credit_card; #comprobar tabla credit_car

/*- Exercici 2 El departament de Recursos Humans ha identificat un error en el número de compte de l'usuari amb ID CcU-2938. 
La informació que ha de mostrar-se per a aquest registre és: R323456312213576817699999. Recorda mostrar que el canvi es va realitzar.*/

update transactions.credit_card
set iban = 'R323456312213576817699999'
where id = 'CcU-2938';

select *
from transactions.credit_card
where id= 'CcU-2938'; #comprobar resultado query

/*- Exercici 3 En la taula "transaction" ingressa un nou usuari amb la següent informació:
Id 	108B1D1D-5B23-A76C-55EF-C568E49A99DD
credit_card_id 	CcU-9999
company_id 	b-9999
user_id 	9999
lat 	829.999
longitude 	-117.999
amount 	111.11
declined 	0*/

use transactions;
insert into credit_card (id) values ('CcU-9999'); #crear primero la tarjeta en credit_card

use transactions;
insert into company (id) values ('b-9999'); #crear la compañia en company

use transactions;
insert into transaction (id, credit_card_id, company_id, user_id, lat, longitude, amount, declined) values('108B1D1D-5B23-A76C-55EF-C568E49A99DD','CcU-9999','b-9999',9999,829.999,-117.999,111.11,0);

select*
from transactions.transaction
where id='108B1D1D-5B23-A76C-55EF-C568E49A99DD'; #comprobacion resultado query

/*- Exercici 4 Des de recursos humans et sol·liciten eliminar la columna "pan" de la taula credit_*card. Recorda mostrar el canvi realitzat.*/

alter table transactions.credit_card drop pan;

show columns from transactions.credit_card;
