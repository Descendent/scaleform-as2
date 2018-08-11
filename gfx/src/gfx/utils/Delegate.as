/** 
 * The Delegate helps resolve function callbacks when no scope can be passed in. Currently, all component callbacks include a scope, so this class may be deprecated.
 */
intrinsic class gfx.utils.Delegate
{
	/**
	 * Creates a function wrapper for the original function so that it runs in the provided context.
	 * @parameter obj Context in which to run the function.
	 * @paramater func Function to run.
	 * @return A wrapper function that when called will make the appropriate scoped callback.
	*/
	static public function create(obj:Object, func:Function) : Function;

}