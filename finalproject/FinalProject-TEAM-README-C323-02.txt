C323 / Spring 2021: Final Project

Dylan Taylor (dydtaylo@iu.edu), Javier Jimenez (jimenjav@iu.edu), Bryan 
Hatami (bhatami@iu.edu), Zach Kilmer (zkilmer@iu.edu)
Flappy Burrd (team 2)




When the app is ran the player starts on a game screen where they can see a play button, the name of the game and tabs at the bottom for our different
windows. If the player pushes the play button the game with start and the player must click the screen to allow the "bird" to move up and down through the game
trying to avoid the poles that come your way. If the player dies they can replay the game by pushing the game tab and it with automatically play the game.
The player can check where their highscore is by clicking the highscore tab. If the play wants to change the game mode to night they can do this by pushing
the select tab at the bottom and push the night button. Once the night button is pushed the player can go back to the game tab and see the game played at night.

We ran the app on Bryan Hatami's iPhone 12 mini and it worked perfect

----------------------------------------------------------------------------------------------------------------------------------------------------------------
**PROBLEM WITH SIMULATOR!**
If you open the game and go to play it in the simulator sometimes it opens up and there is nothing in the game scene. If you start the game and there is no play button
or logo then you must clean the building folder, quit the simulator, go into the main storyboard and delete the tab bar controller, then push play, stop and clean the bulid folder again,
quit the simulator, undo deleting the tab bar controller, clean the bulding folder again, save the project and push run. If it doesnt work do it again and make sure
you are cleaning the buliding folder and quiting the simulator after each step. 

If you go to play this game on your phone and the same problem occurres follow the game steps and it should work. Make sure to clean the build folder
----------------------------------------------------------------------------------------------------------------------------------------------------------------

What we did for this Final:
-buttons
-touch
-highscore output
-3 different views (GameScene, HighScoreTable, SelectNight/DayMode)
-persistent local data storage: all relevant data has to be preserved between different app runs/launches, or if the app gets force-quit by the user.
-Core Data
-SpriteKit

Our Assignment01 submission met the following requirements:
	1. Follows the MVC Pattern
	2. Incorporated all required UI elements
	3. Make substantial use of:
		. SpriteKit (the basis of the game)
		. CoreData (used to persist user scores)

Upon reviewing our design documents from Assignment01, it appears we were mostly correct in our expectations of our app, but some things were wrong.
In particular, we did not foresee that the game screen and home screen would be simpler to implement as a single view with SpriteKit. Consequently, we
needed to make another view to meet project requirements. The new view (and funcationality!) we decided to implement was a screen for selecting your
night or day mode. Previously, you could only play in the day mode but now with the way the new view tab works it allows the player to change the background
to night mode. 





