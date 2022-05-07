/*atomic model service_panel*/

#include "service_panel.h"
#include "message.h"
#include "mainsimu.h"
#include "strutil.h"

ServicePanel::ServicePanel (const string &name)
: Atomic (name)
, service_in( addInputPort("service_in") )
, service_message_out ( addOutputPort("service_message_out") )
, preparationTime (0, 0, 5, 0) 
{
	string time(MainSimulator::Instance().getParameter(description(), "preparation"));
	if (time!=" ")
		preparationTime = time;
}

Model &ServicePanel::initFunction()
{ 	
	this->passivate();
	return *this;
}

Model &ServicePanel::externalFunction( const ExternalMessage &msg)
{
	
		message = msg.value();
		this->holdIn (active, preparationTime);


	return *this;
}

Model &ServicePanel::internalFunction ( const InternalMessage &)
{
	this->passivate();
	return *this;
}

Model &ServicePanel::outputFunction( const InternalMessage &msg)
{
	this->sendOutput ( msg.time(), service_message_out, message );

	return *this;
} 
