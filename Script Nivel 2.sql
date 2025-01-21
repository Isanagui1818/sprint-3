/*Exercici 1 Elimina de la taula transaction el registre amb ID 02C6201E-D90A-1859-B4EE-88D2986D3B02 de la base de dades.*/

delete from transactions.transaction 
where id='02C6201E-D90A-1859-B4EE-88D2986D3B02';

select*
from transactions.transaction
where id='02C6201E-D90A-1859-B4EE-88D2986D3B02'; #comprobacion de la eliminacion

/*Exercici 2 La secció de màrqueting desitja tenir accés a informació específica per a realitzar anàlisi i estratègies efectives. 
S'ha sol·licitat crear una vista que proporcioni detalls clau sobre les companyies i les seves transaccions. 
Serà necessària que creïs una vista anomenada VistaMarketing que contingui la següent informació: Nom de la companyia. 
Telèfon de contacte. País de residència. Mitjana de compra realitzat per cada companyia. Presenta la vista creada, ordenant les dades de major a menor mitjana 
de compra.*/

/*select company_name,phone,country, round(avg(amount),2) as media_compras
from transactions.company
	join transaction on company.id=transaction.company_id
where declined= 0
group by company_name,phone,country
order by media_compras desc;*/
SELECT * FROM transactions.vistamarketing; # la vista tiene filtro decline=0 para contar solo transacciones ejecutadas

/*Exercici 3 Filtra la vista VistaMarketing per a mostrar només les companyies que tenen el seu país de residència en "Germany"*/

SELECT * 
FROM transactions.vistamarketing
where country = 'Germany';