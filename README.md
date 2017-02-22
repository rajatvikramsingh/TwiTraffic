# TwiTraffic
The project aims to equip cars with an arduino and sensors to estimate the traffic density at a given intersection, results of which are posted to Twitter to update other drivers.

## Introduction:

As more and more vehicles continue to crowd the roads, the traffic jams are becoming an everyday norm – increasing the carbon emissions. To help the user drive to his destination without being stuck in jams, we propose an application that will help the user make an informed choice regarding his route and possibly he can avoid crowded routes and contribute his bit in reducing the carbon emissions. Assuming there will be many other users, each user’s location and moving speed will be aggregated at the data center and thus the places where traffic is stuck will be determined and the updates will be broadcasted on Twitter. Using these updates, another user, who would be setting out to travel, can alter his route according to his convenience.

We have developed a system which estimates the traffic density between only two traffic lights based on data obtained from the cars crossing the light. The system is tested on the following basis:

1. The accuracy of transmission between the car and the red light for different speeds.

2. Using two transmitter nodes and one receiver node.

## Hardware Requirement

The two main components which constitutes the system are:

1. A Vehicle installed with the following hardware:

    * A microcontroller
    * A accelerometer
    * A Zigbee module

2. A traffic red light with the following hardware:

    * A microcontroller
    * A Zigbee module (Coordinator)
    * An USART cable for updating the status on twitter

## Transmission Protocol

To guarantee a successful transmission, the following protocol was implemented between the traffic light node and the node in the car:

1. The node at the traffic light will act as a server and will continuously broadcast a request to receive packets from the nodes in the car.

2. The other nodes will respond to the request from the server and send their respective IDs to the server.

3. Upon receiving the ID from any of the node in the car, the sever broadcasts the same ID again back to the nodes.

4. The respective node will send the data to the server on receiving its own ID back from the server.

5. The server sends an acknowledgement back on receiving the data.

To ensure synchronizations of the different states of all the nodes, a flag based system is used which keeps the track of its state. There is a timeout implemented in case of any locking state. The image below tries to summarize the transmission protocol. In this case there are two cars A and B and communication is done with node A.

Transmission Protocol:   
![Transmission Protocol](/assets/Transmission_Protocol.png)

## Results

Our system was tested under various scenarios.

1. We fixed the receiver at one place and the transmitter in the car crossed the receiver with varying speeds.

2. It was tested for speeds at 25, 40, 60 and 80 Km/Hr and successful transmissions were recorded at all times.

3. The average transmission time was calculated to be around 40 milliseconds.

4. The maximum distance at which a successful transmission was held was noted to be as 25 meters.

5. The Twitter posts can be found on the following page - (http://twitter.com/#!/TrafficTerrific).

## Challenges

1. The main challenge of our project to come up with a transmission algorithm to guarantee successful transmission of the data between the nodes.

2. The next big challenge was to test the application in real world scenarios and for different speeds.

## References

1. Tutorial for Zigbee: http://www.ladyada.net/make/xbee/ 

## Testing in Progress :)

1. Zigbee module installed on the car.  
![Car](/assets/Car.jpg)

2. Module acting as the server installed at a height on the road.  
![Server](/assets/Server.jpg)

3. Transmission taking place.  
![Trasmit](/assets/Transmit.jpg)

