package api

import (
	"github.com/gin-gonic/gin"
	db "study/simplebank/db/sqlc"
)

type Server struct {
	store *db.Store
	route *gin.Engine
}

func NewServer(store *db.Store) *Server {
	server := &Server{store: store}
	router := gin.Default()

	router.POST("/accounts", server.createAccount)
	//server.router = router
	return server
}
