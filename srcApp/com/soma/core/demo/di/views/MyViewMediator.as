package com.soma.core.demo.di.views {


	import com.soma.core.demo.di.wires.WireTest1;
	import com.soma.core.mediator.Mediator;
	/**
	 * @author Romuald Quantin
	 */
	public class MyViewMediator extends Mediator {
		
		[Inject]
		public var view:MyView;
		
		[Inject]
		public var wire:WireTest1;
		
		public static var count:int = 0; 
		
		public function MyViewMediator() {
			count++;
		}
		
		override public function initialize():void {
			trace(this, "initialize", count, viewComponent, view, view.id);
		}
		
		override public function dispose():void {
			trace(this, "dispose");
			view.dispose();
			view = null;
		}
		
	}
}
