pub mod TacklingSideEffects.AlgebraicEffect.Cafe {
    use TacklingSideEffects.AlgebraicEffect.Payment
    use TacklingSideEffects.Coffee

    pub def buyCoffee(cc: Payment.CreditCard): Coffee \ Payment =
        let coffee = Coffee.make();
        let Coffee.Coffee({price}) = coffee;
        Payment.charge(cc, price);
        coffee
}
