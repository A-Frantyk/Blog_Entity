﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Blog_Entity;
using Blog_Entity.Model;
using Ninject;

namespace Blog_Services.UnitOfWork
{
    public class UnitOfWork_Pattern : IUnitOfWork
    {
        private BlogEntityContext context = new BlogEntityContext();

        #region fields declaration

        private IGenericRepository<Blog> blogItemRepository;
        private IGenericRepository<Writes> writesItemsRepository;
        private IGenericRepository<Comments> commentsItemRepository;
        private IGenericRepository<Topic> topicItemRepository;
        private IGenericRepository<User> userItemRepository;
        private IGenericRepository<UserCredentials> userCredentialsItemRepository;
        private IGenericRepository<Roles> rolesItemRepository;

        #endregion

        #region IUnitOfWork implementation
        
        public IGenericRepository<Blog> BlogItemRepository
        {
            get
            {
                if (this.blogItemRepository == null)
                {
                    this.blogItemRepository = new GenericRepository<Blog>(context);
                }

                return blogItemRepository;
            }
        }

        public IGenericRepository<Topic> TopicItemRepository
        {
            get
            {
                if (this.topicItemRepository == null)
                {
                    this.topicItemRepository = new GenericRepository<Topic>(context);
                }

                return topicItemRepository;
            }
        }
        
        //[Inject]
        public IGenericRepository<Writes> WritesItemRepository
        {
            get
            {
                if (this.writesItemsRepository == null)
                {
                    this.writesItemsRepository = new GenericRepository<Writes>(context);
                }

                return writesItemsRepository;
            }
        }
        
        public IGenericRepository<Comments> CommentsItemRepository
        {
            get
            {
                if (this.commentsItemRepository == null)
                {
                    this.commentsItemRepository = new GenericRepository<Comments>(context);
                }

                return commentsItemRepository;
            }
        }
        
        public IGenericRepository<User> UserItemRepository
        {
            get
            {
                if (this.userItemRepository == null)
                {
                    this.userItemRepository = new GenericRepository<User>(context);
                }

                return userItemRepository;
            }
        }

        public IGenericRepository<UserCredentials> UserCredentialsItemRepository
        {
            get
            {
                if(this.userCredentialsItemRepository == null)
                {
                    this.userCredentialsItemRepository = new GenericRepository<UserCredentials>(context);
                }

                return userCredentialsItemRepository;
            }
        }

        public IGenericRepository<Roles> RolesItemRepository
        {
            get
            {
                if(this.rolesItemRepository == null)
                {
                    this.rolesItemRepository = new GenericRepository<Roles>(context);
                }

                return rolesItemRepository;
            }
        }

        #endregion

    }
}
