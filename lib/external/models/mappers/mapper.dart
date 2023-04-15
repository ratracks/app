abstract class Mapper<Dto, Entity> {
  Entity toEntity(Dto dto);
  Map<String, dynamic> toJson(Entity entity);
}