/*******************************************************************
*
*  DESCRIPTION: Simulator::registerNewAtomics()
*
*  AUTHOR: Amir Barylko & Jorge Beyoglonian 
*
*  EMAIL: mailto://amir@dc.uba.ar
*         mailto://jbeyoglo@dc.uba.ar
*
*  DATE: 27/6/1998
*
*******************************************************************/

#include "modeladm.h" 
#include "mainsimu.h"
#include "queue.h"      // class Queue
#include "generat.h"    // class Generator
#include "cpu.h"        // class CPU
#include "transduc.h"   // class Transducer
#include "trafico.h"    // class Trafico
#include "coin_collector.h" // class coin_collector
#include "balance_display.h" //class balance_display
#include "change_maker.h" // class change_maker
#include "item_selector.h" // class item_selector
#include "message_queue.h" //class message_queue
#include "central_controller.h" // class central_controller
#include "item_processor.h" // class item_processor
#include "service_panel.h" // class service_panel
#include "vending_controller.h"
#include "service_controller.h"

void MainSimulator::registerNewAtomics()
{
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<Queue>() , "Queue" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<Generator>() , "Generator" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<CPU>() , "CPU" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<Transducer>() , "Transducer" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<Trafico>() , "Trafico" ) ;

	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<BalanceDisplay>() , "BalanceDisplay" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<ChangeMaker>() , "ChangeMaker" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<ItemSelector>() , "ItemSelector" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<MessageQueue>() , "MessageQueue" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<CoinCollector>() , "CoinCollector" ) ;

	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<CentralControl>() , "CentralControl" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<ItemProcessor>() , "ItemProcessor" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<ServicePanel>() , "ServicePanel" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<VendingController>() , "VendingController" ) ;
	SingleModelAdm::Instance().registerAtomic( NewAtomicFunction<ServiceController>() , "ServiceController" ) ;
}

