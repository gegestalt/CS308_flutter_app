// For testing purposes, will change in the future
class Event {
  final String name;
  final String thumbnail;
  final String performer;
  final String date;
  final String location;
  final String time;

  Event({
    this.name,
    this.thumbnail,
    this.location,
    this.date,
    this.time,
    this.performer,
  });
}

List<Event> events = [
  Event(
    name: "Sample event 1",
    thumbnail:
        "https://image.shutterstock.com/image-photo/rave-concert-party-edm-festival-600w-1916911232.jpg",
    date: "11.2.2021",
    location: "Istnabul1",
    time: "11.00",
    performer: "Performer1",
  ),
  Event(
    name: "Sample event 2",
    thumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    date: "11.2.2021",
    location: "Istnabul2",
    time: "11.00",
    performer: "Performer2",
  ),
  Event(
    name: "Sample event 3",
    thumbnail:
        "https://image.shutterstock.com/image-photo/confetti-falling-on-festive-concert-600w-1147630022.jpg",
    date: "11.2.2021",
    location: "Istnabul3",
    time: "11.00",
    performer: "Performer3",
  ),
  Event(
    name: "Sample event 4",
    thumbnail:
        "https://image.shutterstock.com/image-photo/close-musician-hands-cello-on-600w-23285866.jpg",
    date: "11.2.2021",
    location: "Istnabul4",
    time: "11.00",
    performer: "Performer4",
  ),
  Event(
    name: "Sample event 5",
    thumbnail:
        "https://image.shutterstock.com/image-photo/piano-flute-golden-shine-sheet-600w-516401134.jpg",
    date: "11.2.2021",
    location: "Istnabul5",
    time: "11.00",
    performer: "Performer5",
  ),
];
