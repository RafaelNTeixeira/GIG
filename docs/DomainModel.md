# Domain Model
![img](https://user-images.githubusercontent.com/93874205/225305386-76db5ff9-d12c-4f42-909c-48bc01754b8e.png)

## Classes
- **`User:`** Represents in general every user of the app. Since we need the client to give us personal informations for the creation of the profiles, this class has  the attributes: username, email, password, wallet, phone number
<br></br>

Since our app has two different types of users, we divided them in the following classification: Service Requester and Service Provider 
- **`Service Requester:`** Represents the user that makes requests to the Service Provider 
- **`Service Provider:`** Represents the user that satisfies the Service Requester's requests. This type of user will need to provide us a location, a description of his work and will have a rating according to its clients satisfactions
<br></br>

- **`Request:`** Represents the request made by the Service Requester. This request will have the Service Requester's location so that the Service Provider knows where he has to go
- **`Service:`** Represents the service that the Service Provider has to offer. It will have a type, a description of what will be done, a total price and how long it will take to finish
- **`Payment:`** Represents the payment that the Service Requester will have to pay after the Service Provider has finished his task. This payment will have various paying options and will have a defined ammount 
- **`Rating:`** Represents the rating given from the Service Requester to the Service Provider after concluding the offer  

