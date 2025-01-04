# Shopping App Interface - Flutter

This project demonstrates a simplified shopping app interface using Flutter. The app features a main screen with multiple sections: displaying products, hot offers, and recently purchased products. The UI is responsive and utilizes widgets such as `PageView`, `GridView`, and `ListView` to showcase product items and hot offers. includes a SignUp page with form validation and navigation to a Shopping screen.
We enhanced the user experience by adding `fade-out and fade-in animations` between the `SignUp page` and the `Shopping page`.

## Features

1. **AppBar**: A title bar with the name "Shopping App."
2. **Product Section**:
   - A heading "Our Products" followed by a `PageView` that shows images of products.
3. **GridView**: Displays products in two columns with an image, text, and an "Add to Cart" icon. Tapping the icon displays a Snackbar with a confirmation message.
4. **Hot Offers**:
   - A heading "Hot Offers" followed by a `ListView` with horizontal scrolling that lists 5 items. Each item displays an image and description.
5. **Responsive Design**:
   - The layout adjusts based on screen size using `MediaQuery`.
6. **Sign Up Page**:

   - Full name validation (first letter must be capitalized)
   - Email validation (must contain @)
   - Password validation (at least 6 characters)
   - Confirm password validation (must match the password)
   - Success dialog and error snackbar messages
   - Navigation to the Shopping screen after successful signup

7. **ADD ANIMATIONS**:
   **Fade-Out Animation on SignUp Page**:

   - When the user clicks the "OK" button in the success dialog, the SignUp page fades out smoothly.
   - This was achieved using the `flutter_animate` package and an `AnimationController`.

   **Fade-In Animation on Shopping Page**:

   - After the SignUp page fades out, the Shopping page fades in with a smooth transition.
   - This was implemented using `PageRouteBuilder` and the `flutter_animate` package.
