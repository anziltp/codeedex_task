# codeedex_task

Using OTP-based authentication and token-based session management, the CodeeDex Task project combines API calls with Flutter. As long as users verify with an OTP token and the app uses tokens to ensure secure communication with the server, this arrangement offers a safe and convenient task management experience. As a result, users may effectively manage their duties across devices and secure and smooth data synchronization is guaranteed.

Overview:
 . Framework: Flutter for cross-platform mobile development.
 . Authentication: OTP-based login system with token-based session management to ensure secure access.
 . API Integration: Handles task management (CRUD operations) and user authentication using external APIs.

 Key Features with OTP and Token-Based Authentication:
 
   1.OTP-Based Authentication:

    .User Login/Signup: Users sign up or log in using their mobile number or email. An API call triggers the sending of a One-Time Password (OTP) to the user’s phone or email.
    .OTP Verification: The user enters the OTP, and the app makes an API call to verify the OTP against the server. Once verified, a token is issued for further authentication.
    .Secure Authentication: By using OTP, the app ensures secure and easy login without the need for passwords.
    
    2.Token-Based Session Management:

     .JWT Tokens: After OTP verification, the server generates a JWT (JSON Web Token) or other authentication token, which is sent to the app. This token is used to authenticate subsequent API requests.
     .Session Persistence: The app stores the token locally (using secure storage mechanisms) to maintain the user session. On app restart or relaunch, the app checks if the token is valid and reuses it to fetch 
     .the user’s data without requiring them to log in again.
     .Token Expiry & Refresh: The app handles token expiration by either refreshing the token or redirecting the user to log in again if the token is invalid.
     
    3.Task Management via API:

     .Create, Read, Update, Delete (CRUD) Operations: Users can manage tasks by creating new tasks, viewing their tasks, updating task details, or deleting tasks. API calls handle all interactions with the server 
     .to keep tasks synchronized.
     .Real-Time Sync: All task-related actions are immediately reflected on the backend via API calls, ensuring that the user’s data is always up-to-date.

    4.OTP and Token Workflow:

     .OTP Request: A user starts by entering their phone number or email. The app sends a request to the backend to generate and send the OTP.
     .OTP Verification: The user enters the received OTP, and the app verifies it through another API request. If the OTP is correct, the server returns a token.
     .Token Storage: The token is stored securely (using Flutter packages like flutter_secure_storage).
     .Authenticated Requests: All subsequent requests to fetch or modify tasks include the token for secure communication with the server.

   Security Considerations:
     .Secure Token Storage: Tokens are stored securely using Flutter packages like flutter_secure_storage to prevent unauthorized access.
     .Token Expiry Handling: The app checks for token expiry and either prompts the user to re-enter their credentials or refreshes the token automatically (if supported by the backend).
     .API Security: All API requests are authenticated using the token to ensure secure data access and modifications.

     
  Benefits of OTP & Token-Based Authentication:
    .Enhanced Security: OTP ensures that only users with valid credentials can access the app. Token-based sessions prevent unauthorized access, keeping user data safe.
    .User Convenience: Users don’t need to remember passwords, and tokens allow them to stay logged in across sessions.
    .Seamless Task Management: Task management operations are performed securely and synchronized in real-time with the backend, allowing users to access their tasks from any device.

    ScreenShots:- https://drive.google.com/drive/folders/13omJFCKlUl4CKSTZIfbrEbQ4kPdmVo-t?usp=sharing

    Apk:- https://drive.google.com/drive/folders/1Qjqjlx9aN-81pvQ_S7BBw36v-oDS_tMX?usp=sharing

