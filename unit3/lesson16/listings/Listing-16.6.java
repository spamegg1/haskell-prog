public class StoreItem {
    String title;
    int yearPublished;
    double price;
}

public class Book extends StoreItem {
    Author author;
    String isbn;
}

public class VinylRecord extends StoreItem {
    String artist;
}
