/*atomic model central_control*/

#include "central_controller.h"
#include "message.h"
#include "mainsimu.h"
#include "strutil.h"

CentralControl::CentralControl (const string &name)
: Atomic (name)
, message_in( addInputPort("message_in") )
, service_panel_in ( addInputPort ( "service_panel_in" ) )
, control_item_out ( addOutputPort ("control_item_out") )
, control_change_out ( addOutputPort ("control_change_out") )
, balance_out ( addOutputPort ("balance_out") )
, queue_out ( addOutputPort ("queue_out") )
, preparationTime (0, 0, 5, 0) 
{
	printf("constructed\n");
	string time(MainSimulator::Instance().getParameter(description(), "preparation"));
	if (time!=" ")
		preparationTime = time;
}

Model &CentralControl :: initFunction()
{ 	
	this->passivate();
	balance = 0;
	printf("initialized!!\n");
	price1 = 1.00;
	quantity1 = 10;
	price2 = 1.25;
	quantity2 = 15;
	return *this;
}
Model &CentralControl::externalFunction( const ExternalMessage &msg)
{
	cout<<"geting messages\n";

	if ( msg.port() == message_in )
	{
		printf("get message in\n");
		double msgout = processMsg((double)msg.value());
		//send msgout to corresponding port.
		//send done to queue.
		//send balance to disply.
		printf("message processed%f\n", (double)msg.value());
		if(returnPort == 1)
		{
			this->sendOutput (msg.time(), control_change_out, msgout );
		}
		if(returnPort == 2)
		{
			this->sendOutput (msg.time(), control_item_out, msgout ); 
		}
        	this->sendOutput (msg.time(), queue_out, 1 ); 
		this->holdIn ( active, preparationTime );
		printf("message sent\n");
	}

	if ( msg.port() == service_panel_in )
	{
		//service message in
		processService(msg.value());
		this->holdIn ( active, preparationTime );
	}
	return *this;
}
Model &CentralControl::internalFunction ( const InternalMessage &)
{
	this->passivate();
	return *this;
}
Model &CentralControl::outputFunction( const InternalMessage &msg)
{
	this->sendOutput (msg.time(), balance_out, balance );
	return *this; 
}	

double CentralControl::processMsg(double msg)
{
	//this processes input msg from the queue
	if (msg == -1)
	{
		//coin changer maker
		//set return port to be change maker and returns balance
		returnPort = 1; //
		double returnVal = balance;
		balance = 0;  //reset balance to be 0
		return returnVal;
	}
	if ((msg > 0) && (msg < 5))
	{
		//coin received from the coin collector
		//update balance and send balance to display
		balance += msg;
		returnPort = 0;
		return balance;
	}
	if ((msg >100) && (msg <= 102))
	{
		if(msg ==  101)
		{
			if((balance >= price1) && (quantity1 > 0))
			{
				balance = balance - price1;
				quantity1--;
				returnPort = 2; //item processor
				return 1; 
			}
		}
		else
		{
			if((balance >= price2) && (quantity2 > 0)) 
			{
				balance = balance - price2;
				quantity2--;
                                returnPort = 2; //item processor
                                return 2; 
			}
		}
		returnPort = 0;
	} 
	return 0;
}

void CentralControl::processService(double msg)
{	
	//msg comes in as a service request to update the food list.
	//msg is in the following format. DDQQPPP where DD represents the ID.
	//QQ represents the quantity and PPP represents the price.
	int id = (int)(msg/100000);
	int quantity = remainder(msg/1000, 100);	
	double price = remainder(msg, 1000)/100;
	printf("id:%d, qua:%d, price:%.2f\n", id, quantity, price);
	if(id == 1)
	{
		quantity1 = quantity;
		price1 = price;
	}
	if(id == 2)
	{
		quantity2 = quantity;
		price2 = price;
	}
}

