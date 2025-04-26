abstract class useCase<Type, params> {
  Future<Type> call({params params});
}
