%w[
  LineItem
  Cart
  Product
  UserReview
].map(&:constantize).map(&:delete_all)

# SHOPPING CART
Product.create(name: "macbook air m2", price: 90_000, image_url: "https://techcrunch.com/wp-content/uploads/2022/07/CMC_1580.jpg?w=1390&crop=1")
Product.create(name: "suzuki jimny", price: 850_000, image_url: "https://d1hv7ee95zft1i.cloudfront.net/custom/car-model-photo/mobile/gallery/2019-suzuki-jimny-5d9ff07a114fb.jpg")
Product.create(name: "crocs sandals", price: 4_500, image_url: "https://media.crocs.com/images/t_pdphero/f_auto%2Cq_auto/products/207711_001_ALT100/crocs")

# USER REVIEW
UserReview.create(author: "Mr. Bean", content: "Not that good... :-(", rating: 2)
UserReview.create(author: "Mrs. Aurora", content: "Works wonderful!", rating: 5)
