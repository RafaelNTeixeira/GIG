# Board Management
Here, you´ll find the board progressions throughout the iterations:

### Before Iter1:
![beforeIT1](https://user-images.githubusercontent.com/93874205/232464256-6d0466b5-26ef-4652-b424-921217c49e1c.png)

### After Iter1:
![AfterIT1](https://user-images.githubusercontent.com/93874205/232463778-f9d38efa-c90d-4f9b-9aee-5581f0c5b6bd.png)

</br>
</br>

### Before Iter2:
![beforeIT2](https://user-images.githubusercontent.com/93874205/232464081-810bb185-eb3e-49f4-8fe6-9ab55b1669c5.png)

### After Iter2:
![afterIT2](https://user-images.githubusercontent.com/93874205/232467266-50f5c1ab-4431-4f18-9d46-4e199540f5e5.png)

</br>
</br>

### Before Iter3:
![image](https://user-images.githubusercontent.com/93678348/235246604-34daef58-949d-4dab-9cff-934dc78edec1.png)

### After Iter3:
![image](https://user-images.githubusercontent.com/93678348/235439800-b14cb63d-3e8a-4550-95c2-ccbf81ed10c0.png)


#### Retrospective:
After this iteration, it's now possible to do the following things:
- After registrating on the app, the user will be directed to a new page so that he decides if he wants to become a Service Requester or a Service Provider. In the case when a user wants to be part of the Service Provider's group, by selecting the "Service Provider" option on the DrowpDownList, some new TextFields will be displayed for him to fill concerning location, tasks he wants to be responsible for and a description of his work. After filling these informations, he will be successfully registered in the database
- After selecting a specific task from the main page, the user, by clicking on the profile picture of a worker, wiil be able to take a look at his most important informations, regarding his age, biography, location and payment per hour (currently, at the end of this iteration, it is not connected to the database)

</br>
</br>

### Before Iter4:
![image](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC12T2/assets/93678348/5f1067e4-6f10-4d52-ab05-56eef2ad7a3a)


### After Iter4:
![image](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC12T2/assets/93678348/c3307753-4cca-4d60-96a2-541b4c97bd3e)
![image](https://github.com/FEUP-LEIC-ES-2022-23/2LEIC12T2/assets/93678348/45622995-aafa-4aad-b54d-272c8ad9bc9f)


#### Retrospective:
After this iteration, it's now possible to do the following things:
- Each task is now only associated to the service providers that opted to work on that task
- The service requester can now submit an offer, sending his desired location for the service provider to go to. This offer is then received by the service provider as "Not checked"
- The service provider can now accept and decline offers and mark them as completed
- Such the service provider and service requester can now track all the received/submited offers and their status (Accepted, Declined, Finished, Not checked)
- The service requester can check the service provider's location and the service provider can now check the location submited on the offer by the service requester, via Google Maps
- The users can now update their profile informations. This page is diferent according to the user service type (service provider or service requester)
</br>

We couldn't implement:
- Chat between service provider and service requester
- Rating system
</br>

Along this iteration we encountered some difficulties:
1. Managing and creating mechanisms utilizing the database, such as updating and retrieving informations from firestore after occurring some app events
2. Creating unit tests for pages and widgets that used the database and acceptance tests

The cause of difficulty 1 was due to our lack of knowledge regarding how to access the database. As for difficulty 2, our lack of knowledge about accessing the database and creating acceptance tests has also shown to impact our performance in this iteration.
To achieve a better performance, next time we will do more a advanced research, in order to be more comfortable in the matter, before moving on to the implementation of the tests

