/**
 * The contents of this file are subject to the Mozilla Public License
 * Version 1.1 (the "License"); you may not use this file except in compliance
 * with the License. You may obtain a copy of the License at
 * 
 * http://www.mozilla.org/MPL/
 * 
 * Software distributed under the License is distributed on an "AS IS" basis,
 * WITHOUT WARRANTY OF ANY KIND, either express or implied.
 * See the License for the specific language governing rights and
 * limitations under the License.
 * 
 * The Original Code is SomaCore.
 * 
 * The Initial Developer of the Original Code is Romuald Quantin.
 * romu@soundstep.com (www.soundstep.com).
 * 
 * Portions created by
 * 
 * Initial Developer are Copyright (C) 2008-2010 Soundstep. All Rights Reserved.
 * All Rights Reserved.
 * 
 */

package com.soma.core.controller {
	import com.soma.core.ns.somans;
	import com.soma.core.interfaces.IModel;
	import com.soma.core.interfaces.ISequenceCommand;
	import com.soma.core.interfaces.ISoma;
	import com.soma.core.interfaces.IWire;

	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	/**
	 * <p><b>Author:</b> Romuald Quantin - <a href="http://www.soundstep.com/" target="_blank">www.soundstep.com</a></p>
	 * <p><b>Resources:</b> <a href="http://www.soundstep.com/downloads/somacore" target="_blank">http://www.soundstep.com/downloads/somacore</a></p>
	 * <p><b>Class version:</b> v1.0.0</p>
	 * <p><b>Actionscript version:</b> 3.0</p>
	 * <p><b>Copyright:</b>
	 * Mozilla Public License 1.1 (MPL 1.1)<br /> 
	 * <a href="http://www.opensource.org/licenses/mozilla1.1.php" target="_blank">http://www.opensource.org/licenses/mozilla1.1.php</a></p>
	 * Command class that will be instantiated when a registered event is dispatched, the framework will automatically call the execute method.
	 * @example
	 * Register a command.
	 * <listing version="3.0">
addCommand(MyEvent.DOSOMETHING, CommandExample);
dispatchEvent(new MyEvent(MyEvent.DOSOMETHING));
	 * </listing>
	 * Create a normal command.
	 * <listing version="3.0">
package  {
	import flash.events.Event;
	import com.soma.core.interfaces.ICommand;
	import com.soma.core.controller.Command;
	
	public class CommandExample extends Command implements ICommand {

		public function execute(event:Event):void {
			
		}
		
	}
}
	 * </listing>
	 * Create an asynchronous command.
	 * <listing version="3.0">
package  {
	import flash.events.Event;
	import com.soma.core.interfaces.ICommandASync;
	import com.soma.core.controller.Command;
	
	public class CommandASyncExample extends Command implements ICommandASync {

		public function CommandASyncExample() {
			
		}
		
		public function execute(event:Event):void {
			
		}
		
		public function fault(info:Object):void {
			
		}
		
		public function result(data:Object):void {
			
		}
		
	}
}
	 * </listing>
	 * @see com.soma.core.controller.SomaController
	 * @see com.soma.core.controller.ParallelCommand	 * @see com.soma.core.controller.SequenceCommand	 * @see com.soma.core.interfaces.ICommand	 * @see com.soma.core.interfaces.ICommandASync	 */
	
	public class Command implements IEventDispatcher {

		//------------------------------------
		// private, protected properties
		//------------------------------------
		
		/** @private */
		private var _instance:ISoma;

		//------------------------------------
		// public properties
		//------------------------------------
		
		
		
		//------------------------------------
		// constructor
		//------------------------------------
		
		/**
		 * Create an instance of the Command class. Should not be directly instantiated, the framework will instantiate the class.
		 */
		public function Command() {
			
		}
		
		//
		// PRIVATE, PROTECTED
		//________________________________________________________________________________________________
		
		/** 
		 * Method that you can optionally overwrite and that is called after the command has been registered with the framework.
		 * @see com.soma.core.controller.SomaController
		 */
		protected function initialize():void {
			
		}
		
		//
		// PUBLIC
		//________________________________________________________________________________________________
		
		/** @private */
		somans function registerInstance(instance:ISoma):void {
			_instance = instance;
			initialize();
		}
		
		/**
		 * Registers an event listener object with an EventDispatcher object so that the listener receives notification of an event.
		 * @param type The type of event.
		 * @param listener The listener function that processes the event.
		 * @param useCapture Determines whether the listener works in the capture phase or the target and bubbling phases.
		 * @param priority The priority level of the event listener.
		 * @param useWeakReference Determines whether the reference to the listener is strong or weak.
		 */
		public final function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
			_instance.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		/**
		 * Dispatches an event into the event flow. The event target is the EventDispatcher object upon which dispatchEvent() is called.
		 * @param event The event object dispatched into the event flow.
		 * @return A value of true unless preventDefault() is called on the event, in which case it returns false.
		 */
		public final function dispatchEvent(event:Event):Boolean {
			return _instance.dispatchEvent(event);
		}
		
		/**
		 * Checks whether the EventDispatcher object has any listeners registered for a specific type of event.
		 * @param type The type of event.
		 * @return A value of true if a listener of the specified type is registered; false otherwise.
		 */
		public final function hasEventListener(type:String):Boolean {
			return _instance.hasEventListener(type);
		}
		
		/**
		 * Removes a listener from the EventDispatcher object. If there is no matching listener registered with the EventDispatcher object, a call to this method has no effect.
		 * @param type The type of event. 
		 * @param listener The listener object to remove. 
		 * @param useCapture Specifies whether the listener was registered for the capture phase or the target and bubbling phases.
		 */
		public final function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
			_instance.removeEventListener(type, listener, useCapture);
		}
		
		/**
		 * Checks whether an event listener is registered with this EventDispatcher object or any of its ancestors for the specified event type.
		 * @param type The type of event. 
		 * @return A value of true if a listener of the specified type will be triggered; false otherwise. 
		 */
		public final function willTrigger(type:String):Boolean {
			return _instance.willTrigger(type);
		}
		
		/**
		 * Retrieves the instance of the framework.
		 * @return An ISoma instance.
		 * @example
		 * <listing version="3.0">var myExtendedSomaClass:SomaApplication = SomaApplication(instance);</listing>
		 */
		public final function get instance():ISoma {
			return _instance;
		}
		
		/**
		 * Get the stage that has been registered to the framework.
		 * @return The stage instance.
		 */
		public final function get stage():Stage {
			return _instance.stage;
		}
		
		/**
		 * Indicates wether a command has been registered to the framework.
		 * @param commandName Event type that is used as a command name.
		 * @return A Boolean.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">hasCommand(MyEvent.DOSOMETHING);</listing>
		 */
		public final function hasCommand(commandName:String):Boolean {
			if (!_instance.controller) return false;
			return _instance.controller.hasCommand(commandName);
		}
		
		/**
		 * Registers a command to the framework.
		 * @param commandName Event type that is used as a command name.
		 * @param command Class that will be executed when a command has been dispatched.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">addCommand(MyEvent.DOSOMETHING, MyCommand);</listing>
		 */
		public final function addCommand(commandName:String, command:Class):void {
			if (!_instance.controller) return;
			_instance.controller.addCommand(commandName, command);
		}
		
		/**
		 * Removes a command from the framework.
		 * @param commandName Event type that is used as a command name.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">removeCommand(MyEvent.DOSOMETHING);</listing>
		 */
		public final function removeCommand(commandName:String):void {
			if (!_instance.controller) return;
			_instance.controller.removeCommand(commandName);
		}
		
		/**
		 * Retrieves the command class that has been registered with a command name.
		 * @param commandName Event type that is used as a command name.
		 * @return A class.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var commandClass:ICommand = getCommand(MyEvent.DOSOMETHING) as ICommand;</listing>
		 */
		public final function getCommand(commandName:String):Class {
			if (!_instance.controller) return null;
			return _instance.controller.getCommand(commandName);
		}
		
		/**
		 * Retrieves all the command names (event type) that have been registered to the framework.
		 * @return An Array of String (command name).
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var commands:Array = getCommands();</listing>
		 */
		public final function getCommands():Array {
			if (!_instance.controller) return null;
			return _instance.controller.getCommands();
		}
		
		/**
		 * Retrieves the sequence command instance using an event instance that has been created from this sequence command.
		 * @param event Event instance.
		 * @return A sequencer (ISequenceCommand).
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var sequencer:ISequenceCommand = getSequencer(myEvent);</listing>
		 */
		public final function getSequencer(event:Event):ISequenceCommand {
			if (!_instance.controller) return null;
			return _instance.controller.getSequencer(event);
		}
		
		/**
		 * Stops a sequence command using an event instance that has been created from this sequence command.
		 * @param event Event instance.
		 * @return A Boolean (true if a sequence command has been stopped).
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var success:Boolean = stopSequencerWithEvent(myEvent);</listing>
		 */
		public final function stopSequencerWithEvent(event:Event):Boolean {
			if (!_instance.controller) return false;
			return _instance.controller.stopSequencerWithEvent(event);
		}
		
		/**
		 * Stops a sequence command using the sequence command instance itself.
		 * @param sequencer The sequence command instance.
		 * @return A Boolean (true if the sequence command has been stopped).
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var success:Boolean = stopSequencer(mySequenceCommand);</listing>
		 */
		public final function stopSequencer(sequencer:ISequenceCommand):Boolean {
			if (!_instance.controller) return false;
			return _instance.controller.stopSequencer(sequencer);
		}
		
		/**
		 * Retrieves all the sequence command instances that are running.
		 * @return An Array of ISequenceCommand instances.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var sequencers:Array = getRunningSequencers();</listing>
		 */
		public final function getRunningSequencers():Array {
			if (!_instance.controller) return null;
			return _instance.controller.getRunningSequencers();
		}
		
		/**
		 * Stops all the sequence command instances that are running.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">stopAllSequencers();</listing>
		 */
		public final function stopAllSequencers():void {
			if (!_instance.controller) return;
			_instance.controller.stopAllSequencers();
		}
		
		/**
		 * Indicates wether an event has been instantiated from a ISequenceCommand class.
		 * @return A Boolean.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var inSequence:Boolean = isPartOfASequence(myEvent);</listing>
		 */
		public final function isPartOfASequence(event:Event):Boolean {
			if (!_instance.controller) return false;
			return _instance.controller.isPartOfASequence(event);
		}
		
		/**
		 * Retrieves the last sequence command that has been instantiated in the framework.
		 * @return An ISequenceCommand instance.
		 * @see com.soma.core.controller.SomaController
		 * @example
		 * <listing version="3.0">var lastSequencer:ISequenceCommand = getLastSequencer();</listing>
		 */
		public final function getLastSequencer():ISequenceCommand {
			if (!_instance.controller) return null;
			return _instance.controller.getLastSequencer();
		}
		
		/**
		 * Indicates wether a model has been registered to the framework.
		 * @param modelName Name of the model.
		 * @return A Boolean.
		 * @see com.soma.core.model.SomaModels
		 * @example
		 * <listing version="3.0">hasModel(MyModel.NAME);</listing>
		 */
		public final function hasModel(modelName:String):Boolean {
			if (!_instance.models) return false;
			return _instance.models.hasModel(modelName);
		}
		
		/**
		 * Registers a model to the framework.
		 * @param modelName Name of the model.
		 * @param model Instance of the model.
		 * @return The model instance.
		 * @see com.soma.core.model.SomaModels
		 * @example
		 * <listing version="3.0">addModel(MyModel.NAME, new MyModel());</listing>
		 */
		public final function addModel(modelName:String, model:IModel):IModel {
			if (!_instance.models) return null;
			return _instance.models.addModel(modelName, model);
		}
		
		/**
		 * Removes a model from the framework and call the dispose method of this model.
		 * @param modelName Name of the model.
		 * @see com.soma.core.model.SomaModels
		 * @example
		 * <listing version="3.0">removeModel(MyModel.NAME);</listing>
		 */
		public final function removeModel(modelName:String):void {
			if (!_instance.models) return;
			_instance.models.removeModel(modelName);
		}
		
		/**
		 * Retrieves the model instance that has been registered using its name.
		 * @param modelName Name of the model.
		 * @return A IModel instance.
		 * @see com.soma.core.model.SomaModels
		 * @example
		 * <listing version="3.0">var myModel:MyModel = getModel(MyModel.NAME) as MyModel;</listing>
		 */
		public final function getModel(modelName:String):IModel {
			if (!_instance.models) return null;
			return _instance.models.getModel(modelName);
		}
		
		/**
		 * Retrieves all the model instances that have been registered to the framework.
		 * @return A Dictionary (the key of the Dictionary is the name used for the registration).
		 * @see com.soma.core.model.SomaModels
		 * @example
		 * <listing version="3.0">var models:Dictionary = getModels();</listing>
		 */
		public final function getModels():Dictionary {
			if (!_instance.models) return null;
			return _instance.models.getModels();
		}
		
		/**
		 * Indicates wether a view has been registered to the framework.
		 * @param viewName Name of the view.
		 * @return A Boolean.
		 * @see com.soma.core.view.SomaViews
		 * @example
		 * <listing version="3.0">hasView(MySprite.NAME);</listing>
		 */
		public final function hasView(viewName:String):Boolean {
			if (!_instance.views) return false;
			return _instance.views.hasView(viewName);
		}
		
		/**
		 * Registers a view to the framework.
		 * @param viewName Name of the view.
		 * @param view Instance of the view.
		 * @return The view instance.
		 * @see  com.soma.core.view.SomaViews
		 * @example
		 * <listing version="3.0">addView(MySprite.NAME, new MySprite());</listing>
		 */
		public final function addView(viewName:String, view:Object):Object {
			if (!_instance.views) return null;
			return _instance.views.addView(viewName, view);
		}
		
		/**
		 * Removes a view from the framework and call the (optional) dispose method of this view.
		 * @param viewName Name of the view.
		 * @see com.soma.core.view.SomaViews
		 * @example
		 * <listing version="3.0">removeView(MySprite.NAME);</listing>
		 */
		public final function removeView(viewName:String):void {
			if (!_instance.views) return;
			_instance.views.removeView(viewName);
		}
		
		/**
		 * Retrieves the view instance that has been registered using its name.
		 * @param viewName Name of the view.
		 * @return An Object instance.
		 * @see com.soma.core.view.SomaViews
		 * @example
		 * <listing version="3.0">var mySprite:MySprite = getView(MySprite.NAME) as MySprite;</listing>
		 */
		public final function getView(viewName:String):Object {
			if (!_instance.views) return null;
			return _instance.views.getView(viewName);
		}
		
		/**
		 * Retrieves all the view instances that have been registered to the framework.
		 * @return A Dictionary (the key of the Dictionary is the name used for the registration).
		 * @see com.soma.core.view.SomaViews
		 * @example
		 * <listing version="3.0">var sprites:Dictionary = getViews();</listing>
		 */
		public final function getViews():Dictionary {
			if (!_instance.views) return null;
			return _instance.views.getViews();
		}
		
		/**
		 * Indicates wether a wire has been registered to the framework.
		 * @param wireName Name of the wire.
		 * @return A Boolean.
		 * @see com.soma.core.wire.SomaWires
		 * @example
		 * <listing version="3.0">hasWire(MyWire.NAME);</listing>
		 */
		public final function hasWire(wireName:String):Boolean {
			if (!_instance.wires) return false;
			return _instance.wires.hasWire(wireName);
		}
		
		/**
		 * Registers a wire to the framework.
		 * @param wireName Name of the wire.
		 * @param view Instance of the wire.
		 * @return The wire instance.
		 * @see com.soma.core.wire.SomaWires
		 * @example
		 * <listing version="3.0">addWire(MyWire.NAME, new MyWire());</listing>
		 */
		public final function addWire(wireName:String, wire:IWire):IWire {
			if (!_instance.wires) return null;
			return _instance.wires.addWire(wireName, wire);
		}
		
		/**
		 * Removes a wire from the framework and call the dispose method of this wire.
		 * @param wireName Name of the wire.
		 * @see com.soma.core.wire.SomaWires
		 * @example
		 * <listing version="3.0">removeWire(MyWire.NAME);</listing>
		 */
		public final function removeWire(wireName:String):void {
			if (!_instance.wires) return;
			_instance.wires.removeWire(wireName);
		}
		
		/**
		 * Retrieves the wire instance that has been registered using its name.
		 * @param wireName Name of the wire.
		 * @return A wire instance.
		 * @see com.soma.core.wire.SomaWires
		 * @example
		 * <listing version="3.0">var myWire:MyWire = getWire(MyWire.NAME) as MyWire;</listing>
		 */
		public final function getWire(wireName:String):IWire {
			if (!_instance.wires) return null;
			return _instance.wires.getWire(wireName);
		}
		
		/**
		 * Retrieves all the wire instances that have been registered to the framework.
		 * @return A Dictionary (the key of the Dictionary is the name used for the registration).
		 * @see com.soma.core.wire.SomaWires
		 * @example
		 * <listing version="3.0">var wires:Dictionary = getWires();</listing>
		 */
		public final function getWires():Dictionary {
			if (!_instance.wires) return null;
			return _instance.wires.getWires();
		}
		
	}
}