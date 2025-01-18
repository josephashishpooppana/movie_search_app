# Movie Search App

This Flutter application allows you to search for movies using the TMDB API and displays the results in a user-friendly interface.

**Features:**

* Search for movies by name using the TMDB API.
* Display search results in a list format, including movie poster, title, and release date.

**Getting Started**

1.  **Prerequisites:**

    - Ensure you have Flutter installed (Recomended version: 3.22) on your system

2.  **Clone the repository:**

    - Clone this repository or download the project files.

3.  **Install dependencies:**

    - Open a terminal in the project directory and run:
      ```bash
      flutter pub get
      ```

4.  **Obtain a TMDB API key:**

    - Create a free account on TMDB: [https://www.themoviedb.org/account/signup](https://www.google.com/url?sa=E&source=gmail&q=https://www.themoviedb.org/account/signup)
    - Go to your account settings and navigate to the API section.
    - Create a new API key and copy it.

5.  **Configure API key:**

    - Create a `.env`, file and add `TMDB_API_KEY` with your actual TMDB API key. (As of now I have pushed the .env file)

**Running the App**

1.  **Run the app:**

    - In your terminal, run:
      ```bash
      flutter run -d <YOUR_DEVICE>
      ```