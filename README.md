# Ruby Music Library

A simple cli-based music library implemented with ruby. The application uses a specified path to import music files with names having the format below:

```sh
    Artist-Name - Song-Name - Genre-Name.mp3
```
It then gives the user the ability to list the various songs, artists or genres, play a specific song or search via song, artist or genre

### Getting Started

1.  Clone this repositoy:
    ```sh
    $ git clone https://github.com/andela-anwocha/checkpoint-one-music-lib.git
    ```

2.  Navigate into the cloned repository folder:

    ```sh
    $ cd checkpoint-one-music-lib
    ```

3.  Install Dependecies:
    ```sh
    $ bundle install
    ```

### Usage
Still in the checkpoint-one-music-lib folder, enter:
    ```sh
    $ bin/musiclibrary
    ```

#### List of commands

    ```sh
    $ list songs - Displays All Imported Songs
    $ list genres - Displays All Genres from Imported Songs
    $ list artists - Displays All Artists from Imported songs
    $ play song - Play a particular Song with Song number
    $ list artist - Displays Songs with artist name
    $ list genre - Displays Songs with specified genre name
    ```
    
### Dependecies
Refer to Gemfile for dependencies

#### Running Tests
1. Make sure "rspec" is installed by running:
    ```sh
        $ bundle show rspec
    ```
    If a path is listed, then rspec is installed.

2. Run rspec through bundle:
    ```sh
        $ bundle exec rspec spec
    ```

