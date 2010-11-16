package com.soundstep.somacolor.controllers.events {	import flash.events.Event;	/**	 * <b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a><br />	 * <b>Class version:</b> 1.0<br />	 * <b>Actionscript version:</b> 3.0<br />	 * <b>Copyright:</b> 	 * <br />	 * <b>Date:</b> Sep 22, 2009<br />	 * <b>Usage:</b>	 * @example	 * <listing version="3.0"></listing>	 */		public class ChainEvent extends Event {		//------------------------------------		// private, protected properties		//------------------------------------				//------------------------------------		// public properties		//------------------------------------				public static const CHAIN:String = "chain";				//------------------------------------		// constructor		//------------------------------------				public function ChainEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {			super(type, bubbles, cancelable);		}				//		// PRIVATE, PROTECTED		//________________________________________________________________________________________________				//		// PUBLIC		//________________________________________________________________________________________________				override public function clone():Event {			return new ChainEvent(type, bubbles, cancelable);		}				override public function toString():String {			return formatToString("ChainEvent", "type", "bubbles", "cancelable", "eventPhase");		}			}}