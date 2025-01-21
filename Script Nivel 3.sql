/*Exercici 1 La setmana vinent tindràs una nova reunió amb els gerents de màrqueting. Un company del teu equip va realitzar modificacions en la base de dades, però no recorda com les va realitzar. 
Et demana que l'ajudis a deixar els comandos executats per a obtenir el següent diagrama:*/

CREATE TABLE user (
        id INT PRIMARY KEY,
        name VARCHAR(100),
        surname VARCHAR(100),
        phone VARCHAR(150),
        email VARCHAR(150),
        birth_date VARCHAR(100),
        country VARCHAR(150),
        city VARCHAR(150),
        postal_code VARCHAR(100),
        address VARCHAR(255));

rename table user to data_user; #cambio del nombre de la tabla por el mismo del diagrama

alter table transaction
    add constraint fk_data_user_id foreign key (user_id) references data_user(id);

alter table transactions.company drop website;
alter table transactions.credit_card add column fecha_actual DATE;
alter table transactions.data_user change email personal_email varchar(150);

#deshabilitar las FK
set foreign_key_checks=0;
alter table transactions.credit_card modify id varchar(20);
#habilitar las FK
set foreign_key_checks=1;

/*Exercici 2 L'empresa també et sol·licita crear una vista anomenada "InformeTecnico" que contingui la següent informació:
    ID de la transacció
    Nom de l'usuari/ària
    Cognom de l'usuari/ària
    IBAN de la targeta de crèdit usada.
    Nom de la companyia de la transacció realitzada.
    Assegura't d'incloure informació rellevant de totes dues taules i utilitza àlies per a canviar de nom columnes segons sigui necessari.
Mostra els resultats de la vista, ordena els resultats de manera descendent en funció de la variable ID de transaction.*/

/*select 
	transaction.id as Transaccion, data_user.name as Nombre_usuario, data_user.surname as Apellido,data_user.country as Pais_usuario, 
    iban as IBAN_tarjeta, company_name as Nombre_empresa,company.country as Pais_empresa, declined as Transferencia_denagada
from transactions.transaction
	join data_user on transaction.user_id=data_user.id
    join credit_card on transaction.credit_card_id=credit_card.id
    join company on transaction.company_id=company.id
order by Transaccion desc;*/

SELECT * 
FROM transactions.informetecnico; #comprobacion query
