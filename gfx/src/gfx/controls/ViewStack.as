import gfx.core.UIComponent;
import flash.geom.Rectangle;
/**
 * The CLIK ViewStack displays a single view from a set that is loaded and optionally cached internally. This component can be used for multi-view components such as a TabBox, or Accordion. A ViewStack can also be pointed at another component such as a RadioButton group to automatically change views when the component changes.
 
	<b>Inspectable Properties</b>
	A MovieClip that derives from the UILoader component will have the following inspectable properties:<ul>
	<li><i>visible</i>: Hides the component if set to false.</li>
	<li><i>cache</i>: If set to true, loaded views will be cached internally. This saves on processing time to create the views, but requires an immutable ViewStack targetGroup (see below).</li>
	<li><i>targetGroup</i>: A name of a valid group object, such as  ButtonGroup, that generates ‘change’ events. The current element in the group object must have a data property containing a linkage ID for the view to be loaded and displayed. RadioButtons, for example, have a data property that can be assigned a linkage ID via the Flash Studio Component Inspector.</li>
	<li><i>enableInitCallback</i>: If set to true, _global.CLIK_loadCallback() will be fired when a component is loaded and _global.CLIK_unloadCallback will be called when the component is unloaded. These methods receive the instance name, target path, and a reference the component as parameters.  _global.CLIK_loadCallback and _global.CLIK_unloadCallback should be overriden from the game engine using GFx FunctionObjects.</li></ul>

	<b>States</b>
	There are no states for the ViewStack component. Views loaded and displayed by the ViewStack may have its own states. 
	
	<b>Events</b>
	The ViewStack does not produce any events.
 */
intrinsic class gfx.controls.ViewStack extends UIComponent
{
	public var cache : Boolean;
	private var cachedViews : Object;
	private var depth : Number;
	private var _targetGroup : Object;
	private var inspectableTargetGroup : String;
	/** The currently active, visible view. */
	public var currentView : MovieClip;
	private var container : MovieClip;

	/**
	 * The component or ButtonGroup name to listen to for a "change" event. When the {@code targetGroup} dispatches a "change" event, the view will be changed using the {@code data} property of the {@code targetGroup} as the linkage.
	 */
	public function get targetGroup() : Object;
	public function set targetGroup(value:Object) : Void;


	/**
	 * The constructor is called when a ViewStack or a sub-class of ViewStack is instantiated on stage or by using {@code attachMovie()} in ActionScript. This component can <b>not</b> be instantiated using {@code new} syntax. When creating new components that extend ViewStack, ensure that a {@code super()} call is made first in the constructor.
	 */
	private function ViewStack();

	/**
	 * Instantiate a new view based on a linkage.  If the view has been already cached, it will become visible. The currently visible view will be hidden, and destroyed if it is not cached.
	 * @param linkage The linkage ID of the symbol in the library to create.
	 * @param cache The cache mode of the view.  If the view is already cached, but the cache parameter is false, the view will remain cached.
	 * @returns The view that is created or displayed.
	 */
	public function show(linkage:String, cache:Boolean) : MovieClip;

	/**
	 * Pre-caches a set of views. All the views are set to {@code visible=false}. Currently, views with the same linkage can only be created once.
	 * @param linkages An array of linkages to instantiate.
	 */
	public function precache(linkages:Array) : Void;

	/** @exclude */
	public function toString() : String;

	private function configUI() : Void;

	private function draw() : Void;

	private function createView(linkage:String, cache:Boolean) : MovieClip;

	/**
	 * The view change is triggered by a "change" event on the target. The new view to show is determined by the {@code data} property of the event target. In a {@link gfx.controls.ButtonGroup ButtonGroup}, that will be the {@code selectedButton.data}.  In a ButtonBar or component, a {@code data} property should return the new view linkage.
	 * @see gfx.controls.ButtonGroup ButtonGroup
	 */
	private function changeView(event:Object) : Void;

}