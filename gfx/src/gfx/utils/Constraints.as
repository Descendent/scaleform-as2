/**
 * The Constraints utility helps symbols scale and align the assets contained within them. Elements can be added to a Constraints instance, and they will be reflowed when the {@code update(width,height)} method is called.
 *
 * This utility supports both re-scaling and counter-scaling methods.  Rescaling occurs when the component is scaled back to 100%, and the assets are reflowed and scaled to look correct. Counter-scaling occurs when the component is left at its transformed size, and the assets are scaled inversely to the parent clip.
 */
intrinsic class gfx.utils.Constraints
{
	/** A constant ENUM value representing the left edge of the component **/
	static public var LEFT : Number;
	/** A constant ENUM value representing the right edge of the component **/
	static public var RIGHT : Number;
	/** A constant ENUM value representing the top edge of the component **/
	static public var TOP : Number;
	/** A constant ENUM value representing the the bottom edge of the component **/
	static public var BOTTOM : Number;
	/** A constant ENUM value representing the the left, right, top, and bottom edges of the component **/
	static public var ALL : Number;
	/** Use a counter-scaling mode instead of a reflowing mode if this property is set to true. **/
	public var scaled : Boolean;
	/** The container component that the constraints are applied to. **/
	public var scope : Object;
	private var elements : Array;

	/**
	 * Create a new Constraints instance to assist in the positioning and scaling of an asset inside a component.
	 * @param scope The component scope which contains the constrained asset.
	 * @param scaled Determines if the component is counter-scaled ({@code true}) or not ({@code false}).
	 */
	public function Constraints(scope:MovieClip, scaled:Boolean);

	/**
	 * Add an element to this constraints instance.
	 * @param clip The MovieClip to add as a constrained element.
	 * @param constraints The constraining edges.  A bitwise number which can contain any combination of edge parameters.
	 */
	public function addElement(clip:Object, edges:Number) : Void;

	/**
	 * Remove an element from this Constraints instance
	 * @param clip A reference to the MovieClip to remove.
	 */
	public function removeElement(clip:MovieClip) : Void;

	/**
	 * Get the contraints rules for a given object.
	 * @param clip A reference to the MovieClip the contraints apply to.
	 * @returns the constraints rules object for the specified clip
	 */
	public function getElement(clip:Object) : Object;

	/**
	 * Change the width/height and x/y of each registered component based on the scope's updated size and the constraint rules.
	 * @param width The new width of the scope component.
	 * @param height The new height of the scope component.
	 */
	public function update(width:Number, height:Number) : Void;

	/** @exclude */
	public function toString() : String;

}