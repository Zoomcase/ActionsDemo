using Microsoft.EntityFrameworkCore;
using Memos.Models;

namespace Memos.Data
{
    public class MemoContext : DbContext
    {
        public MemoContext(DbContextOptions<MemoContext> options) : base(options)
        {
        }

        public DbSet<Memo> Memo { get; set; }
    }
}
