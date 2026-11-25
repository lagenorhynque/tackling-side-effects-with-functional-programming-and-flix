pub mod TacklingSideEffects.HigherOrderFunction.Cafe {
    use TacklingSideEffects.Coffee

    pub def buyCoffee(charge: Float64 -> Unit \ ef): Coffee \ ef =
        let coffee = Coffee.make();
        let Coffee.Coffee({price}) = coffee;
        charge(price);
        coffee
}
