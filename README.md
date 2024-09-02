# Dating App Animation
Simple basic features for a dating app developed with SwiftUI.
No external library was used in this codebase.

## Acceptance Criteria
- [x] Profile card should include the name, age and a photo of the person
- [x] Implement swipe gestures to allow users to swipe profiles up or down
- [x] When user swipes a profile card up/down, it should indicate a DATE/DOWN label on center of card. After completing the animation, it should move on to the next profile.
- [x] Use animation to make the swiping interaction smooth and visually appealing.

## Software Architecture Pattern
The pattern used here is Model View View Model (MVVM).  This has the benefit of loose coupling, code reusability, and testability.
In addition, there is a strong emphasis on service dependency injection which allows the service to be easily changed.

## API Service
The **DaterService** conforms to the Protocol: **HTTPDataDownloader** which is a scaleable generic service that can be used for any model type.

## Testing
MockData and MockService has been created for Unit Testing to test the basic functionality of:
- Remote data retrieval and parsing to the model
- **DaterViewModel** functionality

## Animation
When a person match to Date/Down, an animation is executed when changing profiles.  The Date/Down indicator slowly shows up as user drags the Dater image.  I chose to show the linear gradient colors when a match is executed.

# Demo
![DownAppCodeChallengeDemo](https://github.com/user-attachments/assets/ad23b2bc-754d-4810-9bda-263c48b9d0b8)
