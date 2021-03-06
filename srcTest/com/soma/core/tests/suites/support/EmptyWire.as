package com.soma.core.tests.suites.support {
	import flash.events.Event;
	import com.soma.core.interfaces.IWire;
	import com.soma.core.wire.Wire;
	
	/**
	 * <b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a><br />
	 * <b>Class version:</b> 1.0<br />
	 * <b>Actionscript version:</b> 3.0<br />
	 * <b>Date:</b> Oct 8, 2010<br />
	 * @example
	 * <listing version="3.0"></listing>
	 */
	
	public class EmptyWire extends Wire implements IWire {

		//------------------------------------
		// private, protected properties
		//------------------------------------
		
		

		//------------------------------------
		// public properties
		//------------------------------------
		
		public static const NAME:String = "EmptyWire";
		
		public static const EVENT_INITIALIZED:String = "EmptyWire::Event.EVENT_INITIALIZED";
		public static const EVENT_DISPOSED:String = "EmptyWire::Event.EVENT_DISPOSED";
		
		//------------------------------------
		// constructor
		//------------------------------------
		
		public function EmptyWire() {
			super(NAME);
		}
		
		//
		// PRIVATE, PROTECTED
		//________________________________________________________________________________________________
		
		override protected function initialize():void {
			dispatchEvent(new Event(EVENT_INITIALIZED));
		}
		
		override protected function dispose():void {
			dispatchEvent(new Event(EVENT_DISPOSED));
		}
		
		//
		// PUBLIC
		//________________________________________________________________________________________________

		
		
	}
}