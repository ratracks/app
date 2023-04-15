abstract class Mapper<Dto, Entity> {
  Entity toEntity(Dto dto);
  Map<String, dynamic> toPayload(Entity entity);
}