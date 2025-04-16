import "@typespec/http";

using TypeSpec.Http;

@service(#{
  title: "API Service",
  version: "1.0.0",
})
namespace BasicApiService;

@route("/operations")
interface Operations {
    @route("sayhello")
    @get sayHello(): string[];
}
