import flash.geom.Rectangle;
import gfx.core.UIComponent;
import gfx.layout.Panel;
/**
 * The StagePanel derives from the Panel class and provides a single inspectable interface to define the SWF's stage mode. It is expected to be attached to the root level container, and is not intended to be composed inside other Panels.
 */
intrinsic class gfx.layout.StagePanel extends UIComponent
{
	public var scaleMode : String;
	private var _offsets : Object;
	private var _orect : flash.geom.Rectangle;
	private var _elements : Array;
	static private var LEFT : Number;
	static private var TOP : Number;
	static private var CENTER : Number;
	static private var RIGHT : Number;
	static private var BOTTOM : Number;
	static private var ALL : Number;

	public function StagePanel();

	/** @exclude */
	public function toString() : String;

	private function onResize() : Void;

	private function configUI() : Void;

	public function addElement(clip:Object, hconstrain:Number, vconstrain:Number) : Void;

	private function draw() : Void;

	private function processAlignment() : Void;

}