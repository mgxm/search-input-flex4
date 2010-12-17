package assets.skins.searchInput
{
	import components.pedido.popups.clientes.clientePopUp;
	
	import flash.display.DisplayObject;
	import flash.events.Event;
	import flash.events.FocusEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.controls.Alert;
	import mx.controls.Image;
	import mx.controls.Label;
	import mx.core.Container;
	import mx.core.IFlexDisplayObject;
	import mx.events.FlexEvent;
	import mx.managers.PopUpManager;
	
	import spark.components.Group;
	import spark.components.TextInput;
	
	public class SearchInput extends TextInput
	{		
		private var popUp:IFlexDisplayObject;
		
		public function SearchInput()
		{
			this.addEventListener(FlexEvent.CREATION_COMPLETE, OnComplete);
			super();
		}
		
		//--------------------------------------------------------------------
		//
		// 	Properties
		//
		//--------------------------------------------------------------------
		[SkinPart(required="false")]
		public var searchIcon:Image;
		
		//--------------------------------------------------------------------
		//
		//	Override methods
		//
		//--------------------------------------------------------------------
		override protected function partAdded(partName:String, instance:Object):void
		{
			super.partAdded(partName, instance);
			
			if( instance == searchIcon)
			{
				searchIcon.addEventListener(MouseEvent.CLICK, searchIcon_clickHandler);
			}
		}
		
		//--------------------------------------------------------------------
		//
		//	Handlers
		//
		//--------------------------------------------------------------------
		private function searchIcon_clickHandler(e:MouseEvent):void
		{
			popUp = PopUpManager.createPopUp(DisplayObject(parentApplication), popUpClass, true);
			popUp.addEventListener(FlexEvent.CREATION_COMPLETE, popUpCreationCompleteHandler);
		}
		
		private function popUpCreationCompleteHandler(event:FlexEvent):void
		{
			popUp.removeEventListener(FlexEvent.CREATION_COMPLETE, popUpCreationCompleteHandler);
			
			var point:Point = Group(parent).contentToGlobal(new Point(x, y));
			popUp.move(point.x+width, point.y);

		}
		
		private function OnComplete(event:FlexEvent):void
		{
			this.setStyle("skinClass", Class(searchInput));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  popUpClass
		//----------------------------------
		
		private var _popUpClass:Class;
		
		[Bindable]
		
		public function get popUpClass():Class
		{
			return _popUpClass;
		}
		
		public function set popUpClass(value:Class):void
		{
			_popUpClass = value;
		}
		
	}
}