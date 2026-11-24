pub mod TacklingSideEffects.HigherOrderFunction.Cafe {
    use TacklingSideEffects.Coffee

    pub def buyCoffee(charge: Float64 -> Unit \ IO): Coffee \ IO =
        let coffee = Coffee.make();
        let Coffee.Coffee({price}) = coffee;
        charge(price);
        coffee
}
