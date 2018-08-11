import gfx.core.UIComponent;
import gfx.utils.Constraints;
/**
 * The Panel defines a minimal container with support for constraining sub-elements (other Panels and non-Panel elements), defining focus behavior and setting controller input support for sub-elements. This class is expected to be attached to container symbols that require the aforementioned functionality/behaviors.
 */
intrinsic class gfx.layout.Panel extends UIComponent
{
	public var vconstrain : String;
	public var hconstrain : String;
	public var focusModeVertical : String;
	public var focusModeHorizontal : String;
	public var controllerMask : String;
	private var _constraints : Constraints;
	private var _hcenter : Array;
	private var _vcenter : Array;

	public function Panel();

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	private function addToHCenter(clip:MovieClip) : Void;

	private function addToVCenter(clip:MovieClip) : Void;

	private function draw() : Void;

}