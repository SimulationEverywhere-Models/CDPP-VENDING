/*atomic model coin_collector*/

#include "coin_collector.h"
#include "message.h"
#include "mainsimu.h"
#include "strutil.h"

CoinCollector :: CoinCollector (const string &name)
: Atomic (name)
, coin_in( addInputPort("coin_in") )
, out ( addOutputPort("out") )
, preparationTime (0, 0, 5, 0) 
{
	string time(MainSimulator::Instance().getParameter(description(), "preparation"));
	if (time!=" ")
		preparationTime = time;
}

Model &CoinCollector :: initFunction()
{ 	
	this->passivate();
	coin_amount = 0;
	return *this;
}
Model &CoinCollector :: externalFunction( const ExternalMessage &msg)
{
	coin_amount = msg.value();
       	this->holdIn ( active, preparationTime );
	return *this;
}
Model &CoinCollector :: internalFunction ( const InternalMessage &)
{
	this->passivate();
	return *this;
}
Model &CoinCollector :: outputFunction( const InternalMessage &msg)
{
	this->sendOutput ( msg.time(), out, coin_amount );
	return *this; 
}	
