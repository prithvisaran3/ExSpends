addnewcategory({required data}) {
  if (data != null) {
    final map = {'name': "$data", 'icon': "assets/images/auto.png"};
    categories.add(map);
    categories;
    print(categories);
  }
}

List categories = [
  {"name": "Travel", "icon": "assets/images/auto.png"},
  {"name": "Food", "icon": "assets/images/eating.png"},
  {"name": "Charity", "icon": "assets/images/charity.png"},
  {"name": "Gift", "icon": "assets/images/gift.png"},
];
