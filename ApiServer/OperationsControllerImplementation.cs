namespace BasicApi.Server
{
    public class OperationsControllerImplementation : IOperationsController
    {
        public System.Threading.Tasks.Task<System.Collections.ObjectModel.ObservableCollection<string>> SayHelloAsync()
        {
            System.Collections.ObjectModel.ObservableCollection<string> result = new ()
            {
                "Hello",
                "World"            
            };

            return Task.FromResult(result);
        }
    }
}
