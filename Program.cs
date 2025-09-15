//A minimal ASP.NET Core WebApi to demonstrate load balancing
//IT returns a unique identifier for the instance to track which 
//server is handling the request

//Create a unique identifier for this specific instance of the API
//This allows us to see which container is responding to a request. 
var instanceId = Guid.NewGuid().ToString("N");

var builder = WebApplication.CreateBuilder(args);

builder.WebHost.ConfigureKestrel(options =>
{
    options.ListenAnyIP(8080);
});

var app = builder.Build();

//Map a GET request to the root URL ("/") to return the instance ID.
app.MapGet("/", () => new
{
    instanceId = instanceId,
    MachineName = Environment.MachineName,
    Message = $"Hello from {instanceId}"
});

app.Run();