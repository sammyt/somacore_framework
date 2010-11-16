package com.soundstep.somacolor.controllers.events {	import flash.events.Event;	/**	 * <b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a><br />	 * <b>Class version:</b> 1.0<br />	 * <b>Actionscript version:</b> 3.0<br />	 * <b>Copyright:</b> 	 * <br />	 * <b>Date:</b> Sep 24, 2009<br />	 * <b>Usage:</b>	 * @example	 * <listing version="3.0"></listing>	 */		public class ColorDataEvent extends Event {		//------------------------------------		// private, protected properties		//------------------------------------				//------------------------------------		// public properties		//------------------------------------				public static const LOAD:String = "ColorDataEvent.LOAD";		public static const UPDATED:String = "ColorDataEvent.UPDATED";				//------------------------------------		// constructor		//------------------------------------				public function ColorDataEvent(type:String, bubbles:Boolean = true, cancelable:Boolean = false) {			super(type, bubbles, cancelable);		}				//		// PRIVATE, PROTECTED		//________________________________________________________________________________________________				//		// PUBLIC		//________________________________________________________________________________________________				override public function clone():Event {			return new ColorDataEvent(type, bubbles, cancelable);		}				override public function toString():String {			return formatToString("ColorDataEvent", "type", "bubbles", "cancelable", "eventPhase");		}			}}