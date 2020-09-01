using Microsoft.EntityFrameworkCore;
using Memos.Models;

namespace Memos.Data
{
    public class MemoContext : DbContext
    {
        public MemoContext(DbContextOptions<MemoContext> options) : base(options)
        {
            var connection = (Microsoft.Data.SqlClient.SqlConnection) Database.GetDbConnection();
            connection.AccessToken = (new Microsoft.Azure.Services.AppAuthentication.AzureServiceTokenProvider()).GetAccessTokenAsync("https://database.windows.net/").Result;
        }

        public DbSet<Memo> Memo { get; set; }
    }
}
