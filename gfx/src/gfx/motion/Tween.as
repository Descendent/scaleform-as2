/**
 * The Tween class adds tween methods {@code tweenTo()} and {@code tweenFrom()} to all MovieClips when the {@code Tween.init()} method is called.
 */
intrinsic class gfx.motion.Tween extends MovieClip
{
	static private var _instance : Object;
	private var tween__props : Object;
	private var tween__startProps : Object;
	private var tween__ease : Function;
	private var tween__startTime : Number;
	private var tween__duration : Number;

	/** The default ease equation. */
	static public function linearEase(t:Number, b:Number, c:Number, d:Number) : Number;

	/**
	 * Create a new Tween instance. This method should only be called internally by the Tween class on creation, as it is only used to mix the Tween functionality into the MovieClip prototype once.
	 */
	private function Tween();

	/**
	 * Initialize the tween functions in the MovieClip class.  Once initialized, any MovieClip can make use of the Tween methods.
	 * @return Whether Tween was initialized in the current call. If Tween was already initialized, it will return {@code false}.
	 */
	static public function init() : Boolean;

	/**
	 * Tween the properties of a MovieClip specified in the {@code props} object.
	 * @param duration The duration of the tween in seconds
	 * @param props A list of properties in the MovieClip to tween
	 * @param ease An function to use to apply easing to the tween
	 */
	public function tweenTo(duration:Number, props:Object, ease:Function) : Void;

	/**
	 * Tween the properties of a MovieClip from the properties specified in the {@code props} object to the current properties.
	 * @param duration The duration of the tween in seconds
	 * @param props A list of properties in the MovieClip to tween from
	 * @param ease An function to use to apply easing to the tween
	 */
	public function tweenFrom(duration:Number, props:Object, ease:Function) : Void;

	/**
	 * End a tween immediately.
	 * @param jumpToEnd Determines if the tween sets all properties to their destination values, or leaves them at their current value.
	 */
	public function tweenEnd(jumpToEnd:Boolean) : Void;

	private function tween__start(duration:Number, props:Object, ease:Function, startProps:Object) : Void;

	private function tween__to(position:Number) : Void;

	private function tween__run() : Void;

}