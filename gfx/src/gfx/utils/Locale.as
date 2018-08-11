/**
 * The locale class manages translation calls from the component framework, interfacing directly with translation features of the player, or using the GameEngine to make calls to the game for translation.
 */
intrinsic class gfx.utils.Locale
{
	/**
	 * Requested a Locale string from the Player. Currently, this is not wired to the GameEngine or Player.
	 * @param value The untranslated string or ID.
	 * @returns A translated string
	 */
	static public function getTranslatedString(value:String) : String;

}