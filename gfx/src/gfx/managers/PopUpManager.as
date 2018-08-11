import gfx.core.UIComponent;
/**
 * Create pop-up clips that reside in the application root, in order to be shown above all other content.  PopUpManager can be used by {@link DropdownMenu}, {@link Dialog}, Tooltips, {@link DragManager}, and other components. Different types of pop-up content can use pre-determined container depths to ensure a logical order of pop-ups when multiple pop-ups are displayed at the same time. For instance, tooltips and dropdowns will always be higher than dialogs. Constants are provided for pre-determined depth containers, however any number can be passed to layer content in a custom manner.
 */
intrinsic class gfx.managers.PopUpManager
{
	static private var index : Number;

	/**
	 * Create a pop-up clip.
	 * @param context The context used to create the popup instance. Typically this would be the source for the popup.
	 * @param linkage The linkage ID of the clip in the library.
	 * @param initProperties MovieClip properties to be passed into the pop-up.
	 * @param relativeTo Position the clip relative to a different MovieClip. Existing _x and _y properties in the {@code initProperties} object are converted to the global space using the relativeTo MovieClip as the scope.
	 * @returns A reference to the created pop-up.
	 */
	static public function createPopUp(context:MovieClip, linkage:String, initProperties:Object, relativeTo:MovieClip) : MovieClip;

	/**
	 * Remove a currently open pop-up.
	 * @param popUp The pop-up to remove.
	 */
	static public function destroyPopUp(popUp:MovieClip) : Void;

	/**
	 * Move a PopUp relative to another MovieClip.
	 * @param context The context used to create the popup instance. Typically this would be the source for the popup.
	 * @param popUp The pop-up to move.
	 * @param scope The scope to translate the coordinates from.
	 * @param x The new x position.
	 * @param y The new y position.
	 */
	static public function movePopUp(context:MovieClip, popUp:MovieClip, relativeTo:MovieClip, x:Number, y:Number) : Void;

	/**
	 * Center a pop-up in the stage.
	 * @param popUp The pop-up to center
	 */
	static public function centerPopUp(popUp:MovieClip) : Void;

	static private function createPopUpRetry(context:MovieClip, linkage:String, initProperties:Object, relativeTo:MovieClip) : MovieClip;

}